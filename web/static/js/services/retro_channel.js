import { Socket } from "phoenix"

class RetroChannel {
  static configure(config) {
    const socket = new Socket("/socket", { params: { token: config.token } })
    socket.connect()

    const retroChannel = socket.channel(`retro:${config.retroUUID}`)
    return retroChannel
  }
}

export default RetroChannel
