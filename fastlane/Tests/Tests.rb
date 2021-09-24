def devices
    [ "iPhone 11 (14.5)" ]
end

desc "Lane to run all the main app tests"
lane :tests do
    scan(devices: devices,
         formatter: "xcpretty-json-formatter",
         scheme: "HomeWorkApp-Mock",
         clean: true,
         code_coverage: true,
         buildlog_path: "./build/tests_log")
end
