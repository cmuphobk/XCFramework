Pod::Spec.new do |spec|

    spec.name          = File.basename(__FILE__).chomp(".podspec")
    spec.version       = "1.0.0"
    spec.license       = { :type => "Proprietary"}
    spec.summary       = spec.name
    spec.homepage      = "https://git.docdoc.pro/dd-mp/docdoc-ios"
    spec.source        = { :git => '.' }
    spec.author        = "Kirill Smirnov"
    spec.platform      = :ios, "13.0"
    spec.swift_version = "5.4"

    spec.source_files = [
      "XCFrameworkChild/**/*.swift"
    ]

end
