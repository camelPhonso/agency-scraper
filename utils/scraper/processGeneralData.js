import { readFileSync } from "fs"
import path from "path"
import pdf from "pdf-parse"
import variables from "./variables.js"

const variablesArr = Object.keys(variables)
variablesArr.push("Visit of school for / by")

const parseDocument = async pdfPath => {
  const dataBuffer = readFileSync(pdfPath)
  const options = {
    max: 1,
  }
  try {
    const pdfdata = await pdf(dataBuffer, options)
    return pdfdata
  } catch (error) {
    console.error(error)
    throw error
  }
}

const extractValue = (data, regexPattern) => {
  const regex = new RegExp(regexPattern) // create a new regular expression object using the pattern provided
  const match = regex.exec(data[3]) // regex.exec executes the regular expression regex on the fourth element of the data array
  if (match && match[1]) {
    return match[1].trim()
  } 
    return "*"
}

const getNameValue = filePath => {
  const fileBaseTitle = path
    .basename(filePath)
    .replace(/[.pdf]/g, "")
    .replace(/(2018-19)|(2019-20)|(2020-21)|(2021-22)|(2022-23)_/g, "")
    .match(/_+(.+)/)
  const schoolName = fileBaseTitle[1].replace(/-/g, " ")
  return schoolName.trim()
}

const getYearValue = filePath => {
  const yearRegex = /(2018-19)|(2019-20)|(2020-21)|(2021-22)|(2022-23)/
  const fileBaseTitle = path.basename(filePath)

  return fileBaseTitle.match(yearRegex)[0]
}

const updateSchoolDataArr = (word, value, array) => {
  const columns = variables[word]
  const dataObject = { [columns]: value }
  array.push(dataObject)
}

const processGeneralData = async pdfPath => {
  const schoolDataArr = []
  const parsedpdf = await parseDocument(pdfPath)
  const pdftext = parsedpdf.text

  const all = pdftext.split("\n")

  // UDISE CODE and SCHOOL NAME and YEAR
  const udiseRegex = /UDISE CODE(.*?)School Name/g

  const udise_code = { udise_code: extractValue(all, udiseRegex) }
  const schoolname = { schoolname: getNameValue(pdfPath) }
  const year = { year: getYearValue(pdfPath) }

  schoolDataArr.push(udise_code, schoolname, year)

  for (let i = 0; i < all.length; i++) {
    const word = all[i]
    const value = all[i + 1]

    // DIGIBOARD
    if (word === "DigiBoard" && variablesArr.some(variable => variable.includes(word))) {
      updateSchoolDataArr(word, value, schoolDataArr)
      return
    } 
      // ALL OTHER VALUES
      const splitPoint = word.search(/[a-z][A-Z]/)
      let splitWord = word.replace(/[^a-zA-Z0-9\s-/?.()]/g, "")

      if (splitPoint !== -1) {
        splitWord = word.substring(splitPoint + 1)
      }

      if (variablesArr.some(variable => variable.includes(splitWord)) && !variablesArr.includes(value)) {
        updateSchoolDataArr(splitWord, value, schoolDataArr)
      }
    
  }

  return schoolDataArr
}

export default processGeneralData
