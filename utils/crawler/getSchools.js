import "dotenv/config"

import { errorLogColour, thirdLogColour } from "../colours.js"

const baseURL = process.env.BASE_URL
const requestCookie = process.env.COOKIE
const delayInterval = process.env.DELAY

// Fetch Call to the endpoint in each Block
const schoolFetch = async (givenStateId, givenBlock) => {
  const givenDistrictName = givenBlock.districtId
  const givenBlockName = givenBlock.eduBlockId

  try {
    const options = {
      method: "POST",
      headers: {
        cookie: requestCookie,
        "Content-Type": "application/x-www-form-urlencoded",
        "User-Agent": "insomnia/8.3.0",
      },
      body: new URLSearchParams({
        stateName: givenStateId,
        districtName: givenDistrictName,
        blockName: givenBlockName,
        villageId: "",
        clusterId: "",
        categoryName: "0",
        managementName: "0",
        Search: "search",
      }),
    }

    const response = await fetch(
      `${baseURL}/locateSchool/searchSchool`,
      options,
    )
    const parsedResponse = await response.json()
    const schoolList = parsedResponse.list.map(school => {
      const {
        schoolId,
        schoolName,
        stateId,
        districtId,
        blockId,
        schoolStatus,
        schMgmtId,
        isOperational201819,
        isOperational201920,
        isoperational202021: isOperational202021,
        isoperational202122: isOperational202122,
        isoperational202223: isOperational202223,
      } = school

      return {
        schoolId,
        schoolName,
        stateId,
        districtId,
        blockId,
        schoolStatus,
        schMgmtId,
        isOperational201819,
        isOperational201920,
        isOperational202021,
        isOperational202122,
        isOperational202223,
      }
    })

    const updatedBlock = {
      ...givenBlock,
      schoolList,
    }

    return updatedBlock
  } catch (error) {
    console.error(
      errorLogColour,
      `Error Fetching Schools from ${givenBlock.eduBlockName} Block`,
    )
    throw error
  }
}

// Iterate through all Blocks in a District
export const getSchools = async givenDistrict => {
  try {
    const newBlocks = []

    const processSingleBlock = async index => {
      // base case
      if (index >= givenDistrict.blocks.length) {
        const updatedDistrict = {
          ...givenDistrict,
          blocks: newBlocks,
        }

        return updatedDistrict
      }

      // function declaration
      const currentBlock = givenDistrict.blocks[index]
      const stateId = givenDistrict.districtId

      try {
        const processedBlock = await schoolFetch(stateId, currentBlock)

        newBlocks.push(processedBlock)
        console.log(
          thirdLogColour,
          `Fetched ${processedBlock.schoolList.length} schools for ${
            processedBlock.eduBlockName
          } Block - ${index + 1}/${givenDistrict.blocks.length}`,
        )

        const result = await new Promise(resolve => {
          setTimeout(async () => {
            const nextBlock = await processSingleBlock(index + 1)
            resolve(nextBlock)
          }, delayInterval * 2)
        })
        return result
      } catch (error) {
        console.error(
          errorLogColour,
          `Error getting schools from ${currentBlock.eduBlockName} block`,
        )
        throw error
      }
    }

    // recursive call command
    return processSingleBlock(0)
  } catch (error) {
    console.error(
      errorLogColour,
      `Error getting scools from ${givenDistrict.stateName}: ${error}`,
    )
    throw error
  }
}
