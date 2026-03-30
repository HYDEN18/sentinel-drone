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

class RCMessage {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.rc_throttle = null;
      this.rc_roll = null;
      this.rc_pitch = null;
      this.rc_yaw = null;
    }
    else {
      if (initObj.hasOwnProperty('rc_throttle')) {
        this.rc_throttle = initObj.rc_throttle
      }
      else {
        this.rc_throttle = 0;
      }
      if (initObj.hasOwnProperty('rc_roll')) {
        this.rc_roll = initObj.rc_roll
      }
      else {
        this.rc_roll = 0;
      }
      if (initObj.hasOwnProperty('rc_pitch')) {
        this.rc_pitch = initObj.rc_pitch
      }
      else {
        this.rc_pitch = 0;
      }
      if (initObj.hasOwnProperty('rc_yaw')) {
        this.rc_yaw = initObj.rc_yaw
      }
      else {
        this.rc_yaw = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RCMessage
    // Serialize message field [rc_throttle]
    bufferOffset = _serializer.uint16(obj.rc_throttle, buffer, bufferOffset);
    // Serialize message field [rc_roll]
    bufferOffset = _serializer.uint16(obj.rc_roll, buffer, bufferOffset);
    // Serialize message field [rc_pitch]
    bufferOffset = _serializer.uint16(obj.rc_pitch, buffer, bufferOffset);
    // Serialize message field [rc_yaw]
    bufferOffset = _serializer.uint16(obj.rc_yaw, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RCMessage
    let len;
    let data = new RCMessage(null);
    // Deserialize message field [rc_throttle]
    data.rc_throttle = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [rc_roll]
    data.rc_roll = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [rc_pitch]
    data.rc_pitch = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [rc_yaw]
    data.rc_yaw = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sentinel_drone_driver/RCMessage';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '41f534868ff2103b914923c89e4aa7e5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    uint16 rc_throttle
    uint16 rc_roll
    uint16 rc_pitch
    uint16 rc_yaw
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RCMessage(null);
    if (msg.rc_throttle !== undefined) {
      resolved.rc_throttle = msg.rc_throttle;
    }
    else {
      resolved.rc_throttle = 0
    }

    if (msg.rc_roll !== undefined) {
      resolved.rc_roll = msg.rc_roll;
    }
    else {
      resolved.rc_roll = 0
    }

    if (msg.rc_pitch !== undefined) {
      resolved.rc_pitch = msg.rc_pitch;
    }
    else {
      resolved.rc_pitch = 0
    }

    if (msg.rc_yaw !== undefined) {
      resolved.rc_yaw = msg.rc_yaw;
    }
    else {
      resolved.rc_yaw = 0
    }

    return resolved;
    }
};

module.exports = RCMessage;
