class JoinRequest(object):
    """Base Class for Requests to Join API"""

    API_KEY = "ENTER HERE"
    DEVICE = None
    
    class JoinApiError(BaseException):
        """Error For Join API Requests"""

    import urllib
    import urllib2
    import json

    def __init__(self, **params):

        params["apikey"] = self.API_KEY
        params["deviceId"] = self.DEVICE

        body = self.urllib.urlencode(params)

        join_request = self.urllib2.urlopen(
            "https://joinjoaomgcd.appspot.com/_ah/api/messaging/v1/sendPush",
            data=body.encode()
        )
            
        msg = self.json.loads(
            join_request.read()
        ).get("errorMessage", False)
            
        if msg:
            raise self.JoinApiError(msg)
        
    @staticmethod
    def register(*devices):
        """Add devices to eg.globals"""
        
        for device in devices:
            setattr(eg.globals, device.__name__, device)
            print("ADDED: " + device.__name__ + "(**params)")
        print("DONE")
        
class JoinPushDeviceOne(JoinRequest):
    DEVICE = "ENTER HERE"
	
class JoinPushDeviceTwo(JoinRequest):
    DEVICE = "ENTER HERE"

JoinRequest.register(
	JoinPushDeviceOne,
	JoinPushDeviceTwo
	)