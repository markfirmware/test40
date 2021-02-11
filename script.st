| githubToken |
githubToken := OSEnvironment current at: 'GITHUB_TOKEN' ifAbsent: [nil].

githubToken ifNil: [
    IceCredentialsProvider useCustomSsh: true.
    IceCredentialsProvider sshCredentials
        publicKey: '/run/secrets/myid_rsa.pub';
        privateKey: '/run/secrets/myid_rsa'.
] ifNotNil: [
    IceCredentialStore current
        storeCredential: (IceTokenCredentials new
            username: 'githubuser@user.noreply.github.com';
            token: githubToken;
            yourself) 
        forHostname: 'github.com'.
].