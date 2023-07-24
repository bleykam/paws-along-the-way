
/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function(knex) {
  return knex.schema.hasTable('users').then(function(exists) {
    if (!exists) {
    return knex.schema
      .createTable('users', (table) => {
        table.uuid('id').primary();
        table.string('organization').nullable();
        table.string('user_name').notNullable().unique();
        table.string('first_name').notNullable();
        table.string('last_name').notNullable();
        table.string('address').nullable();
        table.string('phone').nullable();
        table.string('email').notNullable().unique();
        table.string('password').notNullable();
        table.timestamp('updated_at').defaultTo(knex.fn.now());
      })
    }
  })  
  };

    exports.down = function(knex) {
      return knex.schema.dropTableIfExists('users');
    };