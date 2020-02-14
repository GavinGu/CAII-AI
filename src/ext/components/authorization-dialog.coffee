{ signal } = require("../../core/modules/dataflow")
md5 = require("../modules/md5.js")

module.exports = (_, _go) ->
  _codeText = signal ''
  _warnWrongCode = signal no

  validateCode = (code) ->
    md5Value = md5 code
    switch md5Value
      # aiworld2020, caiiauthcode, welcometouse
      when '63db31229b85656143db70a97fc11797', 'dd841bec9b67f36ff2ef82c83712450d', 'f2a8a160c1034e66b1cfa3e234930b92'
      then yes
      else no

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
  