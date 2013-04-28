import org.springframework.context.ApplicationContext
import org.springframework.context.support.ClassPathXmlApplicationContext
import play.api._

object Global extends GlobalSettings {
    
	/**
	* Declare the application context to be used.
	*/
	val ctx = new ClassPathXmlApplicationContext("applicationContext.xml")

	/**
	* Sync the context lifecycle with Play's.
	* @param app
	*/
	override def onStart(app: Application) {
		ctx.start()
	}

	/**
	* Sync the context lifecycle with Play's.
	* @param app
	*/
	override def onStop(app: Application) {
		ctx.stop()
	}

	/**
	* Controllers must be resolved through the application context. There is a special method of GlobalSettings
	* that we can override to resolve a given controller. This resolution is required by the Play router.
	* @param controllerClass
	* @param A
	* @return
	*/
    override def getControllerInstance[A](controllerClass: Class[A]): A = ctx.getBean(controllerClass)

}