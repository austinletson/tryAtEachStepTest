cat try_at_each_step_output.json |  jq '{
  source: {
    name: "tryAtEachStep",
    url: "https://github.com/dwrensha/tryAtEachStep"
  },
  severity: "INFO",
  diagnostics: map({
    message: .message,
    location: {
      path: .filepath,
      range: {
        start: {
          line: .startLine,
          column: .startCol
        },
        end: {
          line: (.startLine + 1),
          column: .startCol
        }
      }
    },
    severity: "INFO",
    suggestions: [{
      text: .newText
    }]
  })
}'
