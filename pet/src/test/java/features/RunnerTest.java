package features;

import com.intuit.karate.*;
import com.intuit.karate.junit5.Karate;

public class RunnerTest {
	
	@Karate.Test
	Karate getpetidAPITest() {
		return Karate.run("getpetid").relativeTo(getClass());
						}
	
	@Karate.Test
	Karate getpetstatusAPITest() {
		return Karate.run("getpetstatus").relativeTo(getClass());
						}
	
	@Karate.Test
	Karate postpetAPITest() {
		return Karate.run("postpet").relativeTo(getClass());
						}
	
	@Karate.Test
	Karate postpetidAPITest() {
		return Karate.run("postpetid").relativeTo(getClass());
						}

	@Karate.Test
	Karate postuploadimageAPITest() {
		return Karate.run("postuploadimage").relativeTo(getClass());
						}
	@Karate.Test
	Karate putupdatepetAPITest() {
		return Karate.run("putapiupdatepet").relativeTo(getClass());
						}
	@Karate.Test
	Karate deletepetAPITest() {
		return Karate.run("deleteapipet").relativeTo(getClass());
						}
}
