private
rcurly
	"end of line joining mode"

	self lineJoiningStack: self lineJoiningStack - 1.
	matchActions := Array with: self rcurlyId.
	^ self createTokenFor: '}'