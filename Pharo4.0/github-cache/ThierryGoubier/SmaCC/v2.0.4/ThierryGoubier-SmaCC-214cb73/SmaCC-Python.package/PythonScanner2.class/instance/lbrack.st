private
lbrack
	"start of line joining mode"

	self lineJoiningStack: self lineJoiningStack + 1.
	matchActions := Array with: self lbrackId.
	^ self createTokenFor: '['