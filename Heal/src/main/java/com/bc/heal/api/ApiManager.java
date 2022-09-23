package com.bc.heal.api;

import java.io.FileReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.bc.heal.vo.Air;
import com.bc.heal.vo.Bus;
import com.bc.heal.vo.Camp;
import com.bc.heal.vo.Train;

public class ApiManager {
	private List<String> busTimeParse(String busTime) {
		List<String> list = new ArrayList<String>();
		int time = 0;

		while (true) {
			time = busTime.indexOf(":", time + 1);
			System.out.println(time);

			if (time == -1) {
				break;
			}
			list.add(busTime.substring(time - 2, time + 3));
		}

		return list;
	}

	public static void main(String[] args) {
		ApiManager api = new ApiManager();
	}
}
