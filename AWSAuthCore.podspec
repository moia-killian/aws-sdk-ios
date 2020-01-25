Pod::Spec.new do |s|
   s.name         = 'AWSAuthCore'
   s.version      = '2.12.6'
   s.summary      = 'Amazon Web Services SDK for iOS.'
 
   s.description  = 'The AWS SDK for iOS provides a library, code samples, and documentation for developers to build connected mobile applications using AWS.'
 
   s.homepage     = 'http://aws.amazon.com/mobile/sdk'
   s.license      = 'Apache License, Version 2.0'
   s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
   s.platform     = :ios, '8.0'
   s.source       = { :git => 'git@github.com:moia-killian/aws-sdk-ios.git',
                      :tag => s.version}
   s.requires_arc = true
   s.dependency 'AWSCore', '2.12.6'
   s.source_files = 'AWSAuthSDK/Sources/AWSAuthCore/*.{h,m}'
   s.public_header_files = 'AWSAuthSDK/Sources/AWSAuthCore/*.h'
 end
 
