import XCTest
@testable import QwirkleKit

final class QwirkleKitTests: XCTestCase {

    func test_measureCombinationPerformance() {
        measureMetrics([.wallClockTime], automaticallyStartMeasuring: false) {
            var player = Player(name: "Test Player")
            var bag = Bag()
            
            bag.shuffle()
            player.hand = Player.Hand(tiles: bag.draw(count: Player.Hand.maxTiles))
            
            startMeasuring()
            _ = player.hand.lines
            stopMeasuring()
        }
    }
}
