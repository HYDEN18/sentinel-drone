// Auto-generated. Do not edit!

// (in-package sentinel_drone_driver.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class PIDError {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.roll_error = null;
      this.pitch_error = null;
      this.throttle_error = null;
      this.yaw_error = null;
      this.zero_error = null;
    }
    else {
      if (initObj.hasOwnProperty('roll_error')) {
        this.roll_error = initObj.roll_error
      }
      else {
        this.roll_error = 0.0;
      }
      if (initObj.hasOwnProperty('pitch_error')) {
        this.pitch_error = initObj.pitch_error
      }
      else {
        this.pitch_error = 0.0;
      }
      if (initObj.hasOwnProperty('throttle_error')) {
        this.throttle_error = initObj.throttle_error
      }
      else {
        this.throttle_error = 0.0;
      }
      if (initObj.hasOwnProperty('yaw_error')) {
        this.yaw_error = initObj.yaw_error
      }
      else {
        this.yaw_error = 0.0;
      }
      if (initObj.hasOwnProperty('zero_error')) {
        this.zero_error = initObj.zero_error
      }
      else {
        this.zero_error = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PIDError
    // Serialize message field [roll_error]
    bufferOffset = _serializer.float32(obj.roll_error, buffer, bufferOffset);
    // Serialize message field [pitch_error]
    bufferOffset = _serializer.float32(obj.pitch_error, buffer, bufferOffset);
    // Serialize message field [throttle_error]
    bufferOffset = _serializer.float32(obj.throttle_error, buffer, bufferOffset);
    // Serialize message field [yaw_error]
    bufferOffset = _serializer.float32(obj.yaw_error, buffer, bufferOffset);
    // Serialize message field [zero_error]
    bufferOffset = _serializer.float32(obj.zero_error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PIDError
    let len;
    let data = new PIDError(null);
    // Deserialize message field [roll_error]
    data.roll_error = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pitch_error]
    data.pitch_error = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [throttle_error]
    data.throttle_error = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw_error]
    data.yaw_error = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [zero_error]
    data.zero_error = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sentinel_drone_driver/PIDError';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '965f4467327ee9171cf551616b23b064';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    float32 roll_error
    float32 pitch_error
    float32 throttle_error
    float32 yaw_error
    
    float32 zero_error
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PIDError(null);
    if (msg.roll_error !== undefined) {
      resolved.roll_error = msg.roll_error;
    }
    else {
      resolved.roll_error = 0.0
    }

    if (msg.pitch_error !== undefined) {
      resolved.pitch_error = msg.pitch_error;
    }
    else {
      resolved.pitch_error = 0.0
    }

    if (msg.throttle_error !== undefined) {
      resolved.throttle_error = msg.throttle_error;
    }
    else {
      resolved.throttle_error = 0.0
    }

    if (msg.yaw_error !== undefined) {
      resolved.yaw_error = msg.yaw_error;
    }
    else {
      resolved.yaw_error = 0.0
    }

    if (msg.zero_error !== undefined) {
      resolved.zero_error = msg.zero_error;
    }
    else {
      resolved.zero_error = 0.0
    }

    return resolved;
    }
};

module.exports = PIDError;
