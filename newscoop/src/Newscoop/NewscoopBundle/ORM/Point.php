<?php
/**
 * @package Newscoop\NewscoopBundle
 * @author Rafał Muszyński <rafal.muszynski@sourcefabric.org>
 * @copyright 2013 Sourcefabric o.p.s.
 * @license http://www.gnu.org/licenses/gpl-3.0.txt
 */

namespace Newscoop\NewscoopBundle\ORM;

/**
 * Point object for spatial mapping
 */
class Point {

    private $latitude;
    private $longitude;

    public function __construct($latitude, $longitude) {
        $this->latitude = $latitude;
        $this->longitude = $longitude;
    }

    public function setLatitude($x) 
    {
        $this->latitude = $x;
    }

    public function getLatitude() 
    {
        return $this->latitude;
    }

    public function setLongitude($y) 
    {
        $this->longitude = $y;
    }

    public function getLongitude() 
    {
        return $this->longitude;
    }

    public function __toString() 
    {

        return sprintf('POINT(%f %f)', $this->latitude, $this->longitude);
    }
}