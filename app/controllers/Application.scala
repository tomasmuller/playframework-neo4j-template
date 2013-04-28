package controllers

import java.util.List

import org.springframework.beans.factory.annotation.Autowired
import play.api._
import play.api.mvc._
import views.html.index
import services.GalaxyService
import models.World

@org.springframework.stereotype.Controller
class Application @Autowired() (galaxyService: GalaxyService) extends Controller {

	def index = Action {
		if (galaxyService.getNumberOfWorlds() == 0) {
			galaxyService.makeSomeWorldsAndRelations()
		}

		def allWorlds: List[World] = galaxyService.getAllWorlds()
		def first: World = allWorlds.get(0)
		def last: World = allWorlds.get(allWorlds.size() - 1)
		def pathFromFirstToLast: List[World] = galaxyService.getWorldPath(first, last)

		Ok(views.html.index.render(allWorlds, pathFromFirstToLast))
	}

}