{ signal } = require("../../core/modules/dataflow")
md5 = require("../modules/md5.js")

module.exports = (_, _go) ->
  _codeText = signal ''
  _warnWrongCode = signal no

  validateCode = (code) ->
    md5Value = md5 code
    if md5Value == '63db31229b85656143db70a97fc11797' # aiworld2020
      yes
    else
      no

  textGetsFocus = ->
    _warnWrongCode no

  accept = ->
    code = _codeText()
    if validateCode code
      _go yes
    else
      _warnWrongCode yes     

  decline = -> _go null

  codeText: _codeText
  warnWrongCode: _warnWrongCode
  textGetsFocus: textGetsFocus
  accept: accept
  decline: decline
  template: 'authorization-dialog'
  