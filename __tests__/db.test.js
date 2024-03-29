import "dotenv/config.js"

import { updateStates, selectAll } from "../model/states.js"

const testState = process.env.STATES_LIST

describe("updateStates", () => {
  test("inserts a new row when db is empty", () => {
    updateStates(testState)
    const outcome = selectAll()
    const result = outcome.length

    expect(result).toBe(1)
  })

  test("replaces the first entry when a new one is added", () => {
    updateStates(testState)
    const outcome = selectAll()
    const result = outcome.length

    expect(result).toBe(1)
  })
})
