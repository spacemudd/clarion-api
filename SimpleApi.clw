    PROGRAM

INCLUDE('winInet.equ')
ApiLog	QUEUE, PRE(log)
LogTitle	STRING(10)
LogMessage	STRING(50)

	END
    MAP
INCLUDE('winInetMap.clw')
    END

INCLUDE('equates.clw'),ONCE 
INCLUDE('DreamyConnection.inc'),ONCE

ApiConnection	DreamyConnection

MyWindow WINDOW('Dreamy API'),AT(,,333,234),GRAY,FONT('MS Sans Serif',8,,FONT:regular)
		LIST,AT(19,87,294,97),USE(?LIST1),FROM(ApiLog),FORMAT('30L(2)|M100L(2)|M')
		BUTTON('&Cancel'),AT(270,203,44,23),USE(?CANCEL),FONT('Segoe UI',10)
		STRING('Log file'),AT(19,68),USE(?STRING1),FONT('Segoe UI',12,,,CHARSET:ANSI)
		STRING('Dreamy API'),AT(100,14),USE(?STRING2),FONT('Segoe UI',24,,,CHARSET:ANSI)
	END
	
CODE
	! session# = ApiConnection.get('localhost')
	! MESSAGE ( session# )
	
	IF DreamyConnection.initiateConnection('localhost')
		log:LogTitle = 'Info'
		log:LogMessage = DreamyConnection.initiateConnection('localhost')
		ADD(ApiLog)
	ELSE
		log:LogTitle = 'Error'
		log:LogMessage = DreamyConnection.initiateConnection('localhost')
		ADD(ApiLog)
	END

	OPEN(MyWindow)
	ACCEPT
		CASE EVENT()
			OF ?CANCEL
				POST(EVENT:CloseWindow)
		END
	END
	
	
 