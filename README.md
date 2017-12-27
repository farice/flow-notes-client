# flow-notes-client
iOS app for compatibility with flow-notes API (@brodykellish)

## Example Apollo Swift usage (reference)
```
let input = MessageInput(content: "hello, world!", author: "@farice")
        // See PostMessage mutation definition in *.graphql
        apollo.perform(mutation: PostMessageMutation(messageInput: input)) { (result, error) in
            if let id = result?.data?.createMessage?.id {
                print("Successfully posted message with id: " + id) // Message id
            } else {
                print("Mutation failed")
            }

        }
```
