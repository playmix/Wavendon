alter TABLE `feature` (
  add column `type` varchar(10) NOT NULL DEFAULT 'property' after `name` ;
  
alter TABLE  `feature`
  add KEY `ind_feature_type`(`type`);

  
  
drop TABLE IF EXISTS `room_feature`;
CREATE TABLE IF NOT EXISTS `room_feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned NOT NULL,
  `feature_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

alter TABLE  `room_feature`
  add UNIQUE KEY `ind_room_feature`(`room_id`, `feature_id`);

alter TABLE `room_feature`
  add CONSTRAINT `room_feature_FK_feature_id`
    FOREIGN KEY (`feature_id`)
    REFERENCES `feature` (`id`)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;


alter TABLE `room_feature`
  add CONSTRAINT `room_feature_FK_room_id`
    FOREIGN KEY (`room_id`)
    REFERENCES `room` (`id`)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;



INSERT INTO `room_feature` (`id`, `room_id`, `feature_id`, `created_at`) VALUES
(1, 2, 37, '2012-02-12 12:11:08'),
(2, 2, 2, '2012-04-15 10:01:06'),
(3, 15, 37, '2012-04-15 09:10:48'),
(4, 15, 2, '2012-02-12 12:11:08');
