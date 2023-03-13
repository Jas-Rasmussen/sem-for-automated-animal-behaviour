## Raw tracking datasets
Each csv contains the following columns
  - filename: a concatenated string that contains camera id, day, start time of recording, and site. All separated by a '_'
  - time: detection time in decimals
  - species: common name of the species detected at a given time
  - spatial_angle: movement angle in degrees
  - tracker_id: tracker id 
  - tracker_length: original length of tracker before any detection post-processing. Recommend not using this value. 
  - detection_depth: y coordinate of the fish detection 
  - detection_length: x coordinate of the fish detection
  - spatial_dist: distance in pixel between detection 1 and detection 2 of tracker_id
  - spatial_speed: value of detection speed in pixel by milisecond
  - site: all data collected at Twin Waters, Queensland
  - tide: tide value in m for every hour of data collection
  - tide_type: ebb, flow, low, or high
  - camera_location: location of camera in the fish passageways. Interpret as 'close' to the pipe entrance
  - spatial_angle_simple: categorical variable of movement, either movement to the left, right, up or down. 
  - sinuosity: numerical index of track curvature. a higher value means more curved. 
  - distance_to_pipe: numerical variable to represent camera_location. Units - metres. 
  