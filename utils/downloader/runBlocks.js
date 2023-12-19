require("dotenv").config()

const delayInterval = process.env.DELAY
const { errorLogColour, thirdLogColour } = require("../colours")
const { runSchools } = require("./runSchools")

const runBlocks = async givenDistrict => {
  try {
    for (let index = 0; index < givenDistrict.blocks.length; index++) {
      const currentBlock = givenDistrict.blocks[index]
      try {
        console.groupCollapsed(
          thirdLogColour,
          `Running ${currentBlock.eduBlockName} Block - ${index + 1}/${
            givenDistrict.blocks.length
          }`,
        )

        await new Promise(resolve => {
          setTimeout(async () => {
            const trigger = await runSchools(currentBlock)
            resolve(trigger)
          }, delayInterval)
        })

        console.groupEnd()
      } catch (error) {
        console.error(errorLogColour, `Error running Block: ${error}`)
        throw error
      }
    }
  } catch (error) {
    console.error(
      errorLogColour,
      `Error running ${givenDistrict.districtName}: ${error}`,
    )
    throw error
  }
}

module.exports = { runBlocks }
