lane :lint do
    swiftlint(
    mode: :lint,      # SwiftLint mode: :lint (default) or :autocorrect
    output_file: "swiftlint.result.json", # The path of the output file (optional)
    executable: 'Pods/SwiftLint/swiftlint',
    config_file: ".swiftlint.yml",     # The path of the configuration file (optional)
    raise_if_swiftlint_error: true,      # Allow fastlane to raise an error if swiftlint fails
    ignore_exit_status: true    # Allow fastlane to continue even if SwiftLint returns a non-zero exit status

    )
end
