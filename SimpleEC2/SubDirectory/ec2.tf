{
   "terraform":[
      {
         "backend":[
            {
               "s3":{
                  "bucket":"octopus-terraform-demo",
                  "key":"terraform-02.tfstate",
                  "region":"us-east-1"
               }
            }
         ]
      }
   ],
   "provider":{
      "aws":{

      }
   },
   "variable":{
      "ami":{
         "type":"string",
         "description":"the AMI to use",
         "default": "ami-cb9ec1b1"
      }
   },
   "resource":{
      "aws_instance":{
         "web":{
            "ami":"${var.ami}",
            "instance_type":"m3.medium",
            "count":1,
            "source_dest_check":false,
            "connection":{
               "user":"ec2-user"
            }
         }
      }
   },
   "output":{
      "test":{
         "value":"hi there"
      },
      "test2":{
         "value":[
            "hi there",
            "hi again"
         ]
      },
      "test3":{
         "value":"${map(\"a\", \"hi\")}"
      }
   }
}