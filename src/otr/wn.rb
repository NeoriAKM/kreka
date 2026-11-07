def wn(application)
  $wn = $bld.get_object('wn')
  $abt = $bld.get_object('abt')

  $jsdef = $bld.get_object('jswn-def')
  $jscon = $bld.get_object('jswn-con')
  $jsprmpt = $bld.get_object('jswn-prmpt')

  $wn.application = application
  $wn.present
end
