#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rclpy                                     
from rclpy.node   import Node                    
from std_msgs.msg import String                  

class SubscriberNode(Node):
    
    def __init__(self, name):
        super().__init__(name)                                    
        self.sub = self.create_subscription(\
            String, "chatter", self.listener_callback, 11)        

    def listener_callback(self, msg):                             
        self.get_logger().info('I heard: "%s"' % msg.data)        
        
def main(args=None):
    rclpy.init(args=args)
    node = SubscriberNode("topic_sub")
    rclpy.spin(node)          
    node.destroy_node()
    rclpy.shutdown()
