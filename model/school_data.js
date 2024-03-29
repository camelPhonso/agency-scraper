import db from "../database/school_data_db.js"

const insertSchoolData = async schoolData => {
  const columns = schoolData
    .map(obj =>
      Object.entries(obj)
        .filter(([key]) => key !== "undefined")
        .map(([key]) => key.replace("-", "_")),
    )
    .flat()

  const data = schoolData
    .map(obj =>
      Object.entries(obj)
        .filter(([key]) => key !== "undefined")
        .map(([, value]) => value),
    )
    .flat()

  const insert_school_data = db.prepare(
    /*sql*/ `INSERT INTO school_data (${columns.join(", ")}) VALUES (${data
      .map(() => "?")
      .join(", ")})`,
  )

  try {
    insert_school_data.run(data)
  } catch (error) {
    console.error(error)
    throw error
  }
}

export default insertSchoolData
