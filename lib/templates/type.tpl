var BaseMessage = require('_dir_').class,
    util = require('util');

var _classname_ = function () {
  _vars_
};

util.inherits(_classname_, BaseMessage);

_classname_.prototype.serialize = function (output) {
  _serialize_
};

_classname_.prototype.deserialize = function (input) {
  _deserialize_
};

_classname_.prototype.getTypeId = function () {
  return _id_;
};

module.exports.id = _id_;
module.exports.class = _classname_;
