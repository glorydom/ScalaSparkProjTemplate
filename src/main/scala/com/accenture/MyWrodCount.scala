package com.accenture

import org.apache.spark.{SparkContext, SparkConf}

/**
  * Created by huihui.b.zhang on 3/28/2016.
  */
object MyWrodCount {
  def main(args:Array[String]):Unit = {

    val conf = new SparkConf();

    conf.setAppName("my Test")
    conf.setMaster("local")

    val sc = new SparkContext(conf)

    val textFile = sc.textFile(args(0))

    println("how many lines in the file:" + textFile.count())
  }
}
