// Embed the two portions of the app in the document
var steeplist = Elm.embed(
  Elm.SteepList,
  document.getElementById('steeplist'));
var steep = Elm.embed(
  Elm.SteepSession,
  document.getElementById('steepsession'));
var steeptimer = Elm.embed(
  Elm.SteepTimer,
  document.getElementById('steeptimer'));
//
// function getNextId() {
// 	var sessions = JSON.parse(
// 		localStorage.getItem('steeps.love-allsteeps'));
// 	var nextId = 0;
// 	sessions.forEach(function(session) {
// 		if (session.uid > nextId) {
// 			nextId = session.uid;
// 		}
// 	});
// 	return nextId + 1;
// }
//
// steep.ports.getSession.subscribe(function(id) {
// 	steep.ports.recvSession.send(
// 		JSON.parse(localStorage.getItem('steeps.love-' + id)));
// });
//
// steep.ports.getSessions.subscribe(function() {
// 	return JSON.parse(
// 		localStorage.getItem('steeps.love-allsteeps'));
// });
//
// steep.ports.setSession.subscribe(function(session) {
// 	removeSessionFromSessions(session.uid);
// 	localStorage.setItem(
// 		'steeps.love-' + session.uid, JSON.stringify(session));
// 	addSessionToSessions(session)
// });
//
// steep.ports.deleteSession.subscribe(function(id) {
// 	removeSessionFromSessions(id);
// 	localStorage.setItem('steeps.love-' + id, '');
// });
//
// // Utilities
// function removeSessionFromSessions(id) {
// 	var sessions = JSON.parse(
// 		localStorage.getItem('steeps.love-allsteeps'));
// 	sessions = sessions.filter(function(d) {
// 		return d.uid != id;
// 	});
// 	localStorage.setItem('steeps.love-allsteeps',
// 		JSON.stringify(sessions));
// }
//
// function addSessionToSessions(session) {
// 	var sessions = JSON.parse(
// 		localStorage.getItem('steeps.love-allsteeps'));
// 	sessions.push(
//     { uid: session.id
// 		, name: session.steepMaterial + ' on ' + session.steepStartDate });
// 	localStorage.setItem('steeps.love-allsteeps',
// 		JSON.stringify(sessions));
// }
