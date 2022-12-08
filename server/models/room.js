const mongoose = require("mongoose");
const playerSchema = require("./player");

const roomShcema = new mongoose.Schema({
  occupancy: {
    type: Number,
    default: 2,
  },
  maxRounds: {
    type: Number,
    default: 6,
  },
  curentRound: {
    required: true,
    type: Number,
    default: 1,
  },
  players: [playerSchema],
  isJoin: {
    type: Boolean,
    default: true,
  },
  turn: playerSchema,
  turnIndex: {
    type: Number,
    default: 0,
  },
});

const roomModel = mongoose.model("Room", roomShcema);
module.exports = roomModel;
