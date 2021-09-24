def devices
    [ "iPhone 8 (14.4)" ]
end

desc "Lane to run all the main app tests"
lane :tests do
    scan(devices: devices,
         formatter: "xcpretty-json-formatter",
         scheme: "HomeWorkApp",
         clean: true,
         code_coverage: true,
         buildlog_path: "./build/tests_log")
end
