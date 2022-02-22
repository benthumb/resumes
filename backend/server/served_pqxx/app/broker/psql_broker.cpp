#include <served/served.hpp>
#include <iostream>
#include <pqxx/pqxx>
#include <string>
#include <boost/algorithm/string.hpp>

using namespace pqxx;

int update_db(std::string nm, std::string addr, std::string e_ml, served::response & res) {
//------------------------------------------------------------------------------
	res << "Initializing pqxx connection...";
	try {
		boost::replace_all(e_ml, "+", "");
		// boost::algorithm::trim_left(nm);
		boost::replace_all(nm, "+", " ");
		boost::algorithm::trim_right(nm);
		boost::replace_all(addr, "+", " ");
		boost::algorithm::trim_right(addr);

		// pqxx::connection c{"postgresql://postgres@127.0.0.1:41251/resume"};
		pqxx::connection c{"postgresql://127.0.0.1:5432/resume?user=postgres&password=password"};
		pqxx::work txn(c);

		res << "******** Calling update_db\n";
		// std::string namehc = "Paul Bentham";

		res << "******** Processed name: " << nm;
		res << "******** Processed address: " << addr;

		// Normally we'd query the DB using txn.exec().  But for querying just one
		// single value, we can use txn.query_value() as a shorthand.

		// Use txn.quote() to escape and quote a C++ string for use as an SQL string
		// in a query's text.
		// int employee_id = txn.query_value<int>(

		// std::string addr_furigana = txn.query_value<std::string>(
		std::string addr_furigana = txn.quote<std::string>(
				"SELECT name "
				"FROM contact_info "
				"WHERE name = \'" + nm + "\'");

		res << "******** Completed call to db\n";
		res << "Updating furigana (address)" << addr_furigana << "\n";

		// Update the employee's salary.  Use exec0() to perform a query and check
		// that it produces an empty result.  If the result does contain data, it
		// will throw an exception.

		// The ID is an integer, so we don't need to escape and quote it when using
		// it in our query text.  Just convert it to its PostgreSQL string
		// representation using to_string().

		txn.exec(
				"UPDATE contact_info "
				"SET addr_furigana = \'" + addr + "\'" + ", email = \'" + e_ml + "\'"
				"WHERE name = \'" + nm + "\'");

		// "WHERE name = " + pqxx::to_string(name));

		// Make our change definite.
		res << "******** Completed second call to db\n";
		res << "******** Comitting db changes\n";
		txn.commit();
	} catch (pqxx::failure err_fail) {
		res << err_fail.what();
		// std::cerr << e.base().what() << std::endl;
		// const pqxx::sql_error *s=dynamic_cast<const pqxx::sql_error*>(&e.base());
		// if (s) res << "Query was: " << s->query() << std::endl;
		return 0;
	}
	return 1;
}

int main(int argc, char const* argv[]) {

	std::string name = "";
	std::string address = "";

	// Create a multiplexer for handling requests
	served::multiplexer mux;

	// GET /hello
	mux.handle("/hello")
		.get([](served::response & res, const served::request & req) {
			res << "Hello world!";
		});

	mux.handle("/users/{id}")
		.get([](served::response & res, const served::request & req) {
				res << "User: " << req.params["id"];
				});

	mux.handle("/contact_info")
		.get([&](served::response &res, const served::request &req) {
				name = req.query["name"];
				address = req.query["address"];
				std::string email = req.query["email"];
				res.set_header("content-type", "application/json");
				res << "{ \"contact_info\": \"Hello, " << ((name.length() > 0) ? name : "world") << "!\" }\n";
				res << "{ \"contact_info\": \"Your email is " << ((email.length() > 0) ? email : "100 Fleet St.") << "!\" }\n";
				res << "{ \"contact_info\": \"Your address is " << ((address.length() > 0) ? address : "yougotmail@aol.com") << "!\" }\n";
				try {
					update_db(name, address, email, res);
				} catch (std::exception& e){
					res << e.what();
					res << "Something went horribly wrong...";
				}
        });

	served::net::server server("127.0.0.1", "8081", mux);
	server.run(10);

	return (EXIT_SUCCESS);
}
