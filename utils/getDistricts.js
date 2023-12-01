require("dotenv").config("")

const { firstLogColour, errorLogColour, bgLogColour } = require("./colours.js")
const baseURL = process.env.BASE_URL
const requestCookie = process.env.COOKIE
const delayInterval = process.env.DELAY
let states = JSON.parse(process.env.STATE_LIST)
const { getBlocks } = require("./getBlocks.js")
const { insertStates } = require("../model/states.js")

// Fetch Call to the endpoint in each State
districtFetch = async givenState => {
  const givenStateId = givenState.stateId

  const options = {
    method: "POST",
    headers: {
      cookie: requestCookie,
      "Content-Type": "application/x-www-form-urlencoded",
      "User-Agent": "insomnia/8.4.0",
    },
    body: new URLSearchParams({ stateId: givenStateId }),
  }

  try {
    const response = await fetch(`${baseURL}/locateSchool/getDistrict`, options)
    const parsedResponse = await response.json()

    givenState = {
      ...givenState,
      districts: parsedResponse,
    }

    console.log(
      firstLogColour,
      `Fetched ${parsedResponse.length} districts for ${givenState.stateName} State`,
    )

    return givenState
  } catch (error) {
    console.error(
      errorLogColour,
      `Error fetching districts from ${givenState.stateName}: ${error}`,
    )
    throw error
  }
}

// Iterate through all States
const getDistricts = async () => {
  try {
    const newStates = []

    const processSingleState = async index => {
      // base case
      if (index >= states.length) {
        const newStatesJSON = JSON.stringify(newStates)
        await insertStates(newStatesJSON)
        console.log(bgLogColour, "States Object saved to DB")
        return
      }

      // function declaration
      const currentState = states[index]

      try {
        console.groupCollapsed()
        const stateWithDistricts = await districtFetch(currentState)
        console.groupCollapsed()
        const stateWithBlocks = await getBlocks(stateWithDistricts)
        console.groupEnd()
        console.groupEnd()

        newStates.push(stateWithBlocks)

        const result = await new Promise(resolve => {
          setTimeout(async () => {
            const result = await processSingleState(index + 1)
            resolve(result)
          }, delayInterval)
        })
        return result
      } catch (error) {
        console.error(
          errorLogColour,
          `Error fetching districts from ${currentState.stateName}: ${error}`,
        )
        throw error
      }
    }

    // recursive call command
    await processSingleState(0)
  } catch (error) {
    console.error(errorLogColour, `Error iterating through States: ${error}`)
    throw error
  }
}

module.exports = { getDistricts }
