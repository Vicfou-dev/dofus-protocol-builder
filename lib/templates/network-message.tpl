var NetworkMessage = (function () {

    function NetworkMessage() {
        ++NetworkMessage.GLOBAL_INSTANCE_ID;
    }
    NetworkMessage.writePacket = function (param1, param2, param3) {
        var _loc5_ = 0;
        var _loc6_ = 0;

        var _loc4_ = this.computeTypeLen(param3.length);
        param1.writeShort(this.subComputeStaticHeader(param2, _loc4_));
        param1.writeUnsignedInt(this.GLOBAL_INSTANCE_ID)

        switch (_loc4_) {
            case 0:
                return;
            case 1:
                param1.writeByte(param3.length);
                break;
            case 2:
                param1.writeShort(param3.length);
                break;
            case 3:
                _loc5_ = param3.length >> 16 & 255;
                _loc6_ = param3.length & 65535;
                param1.writeByte(_loc5_);
                param1.writeShort(_loc6_);
                break;
        }

        param1.writeBytes(param3, 0, param3.buffer.length);

    };
    NetworkMessage.computeTypeLen = function (param1) {
        if (param1 > 65535) {
            return 3;
        }
        if (param1 > 255) {
            return 2;
        }
        if (param1 > 0) {
            return 1;
        }
        return 0;
    };
    NetworkMessage.subComputeStaticHeader = function (param1, param2) {
        return param1 << NetworkMessage.BIT_RIGHT_SHIFT_LEN_PACKET_ID | param2;
    };
    NetworkMessage.BIT_RIGHT_SHIFT_LEN_PACKET_ID = 2;
    NetworkMessage.BIT_MASK = 3;
    NetworkMessage.GLOBAL_INSTANCE_ID = 0;
    return NetworkMessage;
})();
<object>.NetworkMessage = NetworkMessage;