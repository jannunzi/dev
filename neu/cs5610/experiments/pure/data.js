var auditLog = 
[
    {
        "userName": "ashish.kalve",
        "createDate": 1336409058897,
        "note": "First Submit",
        "auditDataRefId": null,
        "localeId": "en_US"
    },
    {
        "userName": "jose.annunziato",
        "createDate": 1336409058897,
        "note": "Second Submit",
        "auditDataRefId": null,
        "localeId": "en_US"
    },
    {
        "userName": "deb.biggar",
        "createDate": 1336409082457,
        "note": "First Accept",
        "auditDataRefId": null,
        "localeId": "en_US"
    },
    {
        "userName": "jen.higgings",
        "createDate": 1336409082457,
        "note": "Second Accept",
        "auditDataRefId": null,
        "localeId": "en_US"
    }
];

var auditData = {
    "header": {
        "eventName": "SUBMIT",
        "eventType": "UPDATE"
    },
    "auditEntry": [
        {
            "objectName": "SETUP",
            "objectGUID": "1094",
            "objectDisplayName": "1094Jignesh-test-ammendment",
            "eventType": "UPDATE",
            "auditField": [
                {
                    "fieldName": "applicationId",
                    "currentValue": 1094,
                    "diffValue": {
                        "oldValue": 1000,
                        "newValue": 2000
                    }
                },
                {
                    "fieldName": "applicationName",
                    "currentValue": "Jignesh-test-ammendment",
                    "diffValue": {
                        "oldValue": 2000,
                        "newValue": 3000
                    }
                }
            ],
            "auditEntry": null
        },
        {
            "objectName": "SETUP-1",
            "objectGUID": "1094",
            "objectDisplayName": "321-1094Jignesh-test-ammendment",
            "eventType": "UPDATE",
            "auditField": [
                {
                    "fieldName": "applicationId-123",
                    "currentValue": 1094,
                    "diffValue": {
                        "oldValue": 3000,
                        "newValue": 4000
                    }
                },
                {
                    "fieldName": "applicationName-234",
                    "currentValue": "Jignesh-test-ammendment",
                    "diffValue": {
                        "oldValue": 5000,
                        "newValue": 6000
                    }
                }
            ],
            "auditEntry": null
        },
        {
            "objectName": "CONTACT",
            "objectGUID": "1094",
            "objectDisplayName": "1094Jignesh-test-ammendment",
            "eventType": "UPDATE",
            "auditField": [],
            "auditEntry": [
                {
                    "objectName": "Primary Contact",
                    "objectGUID": "1265",
                    "objectDisplayName": "1265 - Primary Contact",
                    "eventType": "UPDATE",
                    "auditField": [
                        {
                            "fieldName": "contactId",
                            "currentValue": 1328,
                            "diffValue": {
		                        "oldValue": 5000,
		                        "newValue": 6000
		                    }
                        },
                        {
                            "fieldName": "firstName",
                            "currentValue": "Cliff",
                            "diffValue": {
		                        "oldValue": 7000,
		                        "newValue": 8000
		                    }
                        },
                        {
                            "fieldName": "middleName",
                            "currentValue": null,
                            "diffValue": {
		                        "oldValue": 9000,
		                        "newValue": 10000
		                    }
                        }
                    ],
                    "auditEntry": null
                },
                {
                    "objectName": "Legal Notice Contacts",
                    "objectGUID": "1267",
                    "objectDisplayName": "1267 - Legal Notice Contacts",
                    "eventType": "UPDATE",
                    "auditField": [
                        {
                            "fieldName": "contactId",
                            "currentValue": 1330,
                            "diffValue": {
		                        "oldValue": 15000,
		                        "newValue": 16000
		                    }
                        },
                        {
                            "fieldName": "firstName",
                            "currentValue": "i",
                            "diffValue": {
		                        "oldValue": 25000,
		                        "newValue": 26000
		                    }
                        },
                        {
                            "fieldName": "middleName",
                            "currentValue": null,
                            "diffValue": {
		                        "oldValue": 35000,
		                        "newValue": 36000
		                    }
                        }
                    ],
                    "auditEntry": null
                }
            ]
        }
    ],
    "result": "SUCCESS"
};