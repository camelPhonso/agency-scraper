require("dotenv").config("")

const { firstLogColour, errorLogColour } = require("./colours.js")
const baseURL = process.env.BASE_URL
const requestCookie = process.env.COOKIE
let states = JSON.parse(process.env.STATE_LIST).filter(
  state => state.stateId === 135 || state.stateId === 128,
)

const delayInterval = 1000

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
      `Fetched ${parsedResponse.length} districts for ${givenState.stateName}`,
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
        // insertStates(newStatesJSON)
        console.dir(newStates)
        return
      }

      // function declaration
      const currentState = states[index]

      try {
        const result = await districtFetch(currentState)
        newStates.push(result)

        setTimeout(async () => {
          await processSingleState(index + 1)
        }, delayInterval)
      } catch (error) {
        console.error(
          errorLogColour,
          `Error fetching districts from ${currentState.stateName}: ${error}`,
        )
        throw error
      }

      // recursive call command
    }
    await processSingleState(0)
  } catch (error) {
    console.error(errorLogColour, `Error iterating through States: ${error}`)
    throw error
  }
}

module.exports = { getDistricts }