import { useParams} from "react-router-dom";
import NewRequest from "../../components/NewRequest/NewRequest";
import React from "react";

export default function EditRequestPage({ requestList }) {
  const isEditing = true;
  const { requestId } = useParams();

  const request = requestList.find((item) => item.id === requestId);

  const initialData = {...request};

  return (
    <main>
    <NewRequest isEditing={isEditing} initialData={initialData} />
    </main>
  )
};