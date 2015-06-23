Pod::Spec.new do |s|
  s.name     = 'CKSRecordContext'
  s.version  = '0.5'
  s.license  = 'MIT'
  s.homepage =  'https://github.com/CloudKitSpace/CKSRecordContext'
  s.summary  = "Interaction with CloudKit Records done right ! "
  s.authors  = { 'Nofel Mahmood' =>
                 'nofelmehmood@gmail.com' }
  s.social_media_url = "https://twitter.com/NofelMahmood"
  s.source   = { :git => 'https://github.com/CloudKitSpace/CKSRecordContext.git', :tag => '0.5' }

  s.source_files = 'CKSRecordContext/CKSRecordContext.swift'
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.framework  = 'CloudKit'

end