
		
         module ( 'WinApi' )
             GetLastError (), long, proc, raw, pascal
             sleep ( long ), pascal
         .
     
         module ( 'WinInet' )
     
     !	internetOpen()
     !	@param1		Agent-Host parameter.
     !  @param2		Type of access required (INTERNET_OPEN_TYPE_DIRECT, INTERNET_OPEN_TYPE_PRECONFIG, INTERNET_OPEN_TYPE_PRECONFIG_WITH_NO_AUTOPROXY, INTERNET_OPEN_TYPE_PROXY)
     !	@param3		Proxy name. Don't use empty string as it will be considered a proxy name. Should be NULL.
     !	@param4		Proxy Bypass. Don't use empty string. 
     !	@param5		Flags. INTERNET_FLAG_ASYNC | INTERNET_FLAG_FROM_CACHE | INTERNET_FLAG_OFFLINE
     !
     !	@return		Returns a valid handle for subsequent WinINet functions. (NULL if internetOpen fails)
             internetOpen ( long, long, long, long, long), long, raw, pascal, name( 'InternetOpenA' )
             
     !	internetOpenURL()
     !	@param1		InternetSessionHandle (returned by internetOpen())
     !	@param2		URL to read		| Must begin with ftp:, http:, https:.
     !	@param3		HTTP Headers to send over the request
     !	@param4		HeadersLength - The size of the additional headers, in TCHARs. If this parameter is -1L and @param3 is not NULL, @param3 is assumed to be zero-terminated (ASCIIZ) and the length is calculated.
     !	@param5		Flags	| Read MSDN.
     !
     !	@return		Handle to the URL. NULL if the connection failed.
             internetOpenURL ( long, long, long, long, long, long), long, proc, raw, pascal, name( 'InternetOpenURLA' )
     
     !	internetConnection() - Opens a file transfer to FTP or HTTP session for a given site.
     !
     !	@param1		InternetSessionHandle (returned by internetOpen())
     !	@param2		Server name or the host name. Can be an IP address.
     !	@param3		Server port | Takes a FLAG.
     !	@param4		Username
     !	@param5		Password
     !	@param6		Type of service to access | INTERNET_SERVICE_FTP, INTERNET_SERVICE_GOPHER, INTERNET_SERVICE_HTTP
     !	@param7		Flags	Options specific to the service used. If @param6 is INTERNET_SERVICE_FTP, INTERNET_FLAG_PASSIVE causes the application to use passive FTP semantics.
     !	@param8		Context		Pointer to a variable that contains an application-defined value that is used to identify the application context for the returned handle in callbacks.
     !
     !	@return		Returns a valid handle to the session if the connection is successful, or NULL otherwise. To retrieve extended error information, call GetLastError. An application can also use InternetGetLastResponseInfo to determine why access to the service was denied.
             internetConnect ( long, long, uShort, long, long, long, long, long ), long, raw, pascal, name ( 'InternetConnectA' )
     
     
     !        HINTERNET HttpOpenRequest(
     !            IN HINTERNET hHttpSession,
     !            IN LPCSTR lpszVerb,
     !            IN LPCSTR lpszObjectName,
     !            IN LPCSTR lpszVersion,
     !            IN LPCSTR lpszReferer,
     !            IN LPCSTR FAR * lpszAcceptTypes,
     !            IN DWORD dwFlags,
     !            IN DWORD dwContext
     !        );
             httpOpenRequest ( long, long, long, long, long, long, long, long ), long, raw, pascal, name ( 'HttpOpenRequestA' )
     
     
     !	httpSendRequest() - Creates an HTTP request handle.
     !
     !	@param1		A handle to an HTTP session returned by InternetConnect.
     !	@param2		String that contains the HTTP verb. Default value is GET.
     !	@param3		ObjectName - The path after the ip/host name. E.g. /api/v1/user
     !	@param4		Version - If NULL, default value HTTP/1.0 or HTTP/1.1 depending on Internet Explorer installed.
     !	@param5		Referrer - A pointer to a null-terminated string that specifies the URL of the document from which the URL in the request (lpszObjectName) was obtained. If this parameter is NULL, no referrer is specified.
     !	@param6		A pointer to a null-terminated array of strings that indicates media types accepted by the client.
     !	@param7		Flags - Internet options. This parameter can be any of the following values. - More on MSDN website.
     !	@param8		Context - A pointer to a variable that contains the application-defined value that associates this operation with any application data.
     !
     !	@return		Returns an HTTP request handle if successful, or NULL otherwise. To retrieve extended error information, call GetLastError.
             httpSendRequest ( long, long, long, long, long ), long, proc, raw, pascal, name ( 'HttpSendRequestA' )
     
     
     !	internetReadFile()
     !
     !	@param1		Handle returned from a previous call to InternetOpenUrl, FtpOpenFile, or HttpOpenRequest.
     !	@param2		Pointer to a buffer that receives the data.
     !	@param3		Number of bytes to be read.
     !	@param4		Pointer to a variable that receives the number of bytes read. InternetReadFile sets this value to zero before doing any work or error checking.
     !
     !	@return Returns TRUE if successful, or FALSE otherwise. To get extended error information, call GetLastError. An application can also use InternetGetLastResponseInfo when necessary.
             internetReadFile ( long, long, long, *long), long, proc, raw, pascal
     
     
     !	internetCloseHandle()
     !
     !	@param1 Handle to be closed.
     !
     !	@return TRUE if the handle is successfully closed, or FALSE otherwise. To get extended error information, call GetLastError.
             internetCloseHandle ( long ), long, proc, raw, pascal
     
         .
