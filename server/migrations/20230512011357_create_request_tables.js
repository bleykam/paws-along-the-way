exports.up = function(knex) {
  return knex.schema.hasTable('requests').then(function(exists) {
    if (!exists) {
    return knex.schema
      .createTable('requests', (table) => {
        table.uuid('id').primary();
        table.binary('animal_image');
        table.string('animal').notNullable();
        table.string('organization').nullable();
        table.string('origin').notNullable();
        table.string('destination').notNullable();
        table.date('date').notNullable();
        table.string('time').notNullable();
        table.string('description').notNullable();
        table.string('medical').notNullable();
        table.char('user_id',36).nullable();
        table.char('driver_id',36).nullable();
        table.timestamp('updated_at').defaultTo(knex.fn.now());
        table
          .foreign('user_id')
          .references('id')
          .inTable('users')
          .onUpdate('CASCADE')
          .onDelete('CASCADE');
        table
          .foreign('driver_id')
          .references('id')
          .inTable('users')
          .onUpdate('CASCADE')
          .onDelete('CASCADE');
        })
      }
    })  
    };

    exports.down = function(knex) {
      return knex.schema.dropTableIfExists('requests');
    };