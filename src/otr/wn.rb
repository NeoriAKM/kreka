def wn(application)
  $wn = $bld.get_object('wn')
  $abt = $bld.get_object('abt')

  $jsdef = $bld.get_object('jswn-def')

  $wn.application = application
  $wn.present
end
