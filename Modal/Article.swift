import SwiftUI

struct Article {
    
    var count : Int?
    
    var articles = [
        ArticleBrain(id: 0, title: "Famous places", description: "There are many beautiful places in Myanmar. Among the many famous places in Myanmar, the following places are the beautiful tourist attraction places", image: "logo1", topic: [["Bagan","bagan","Bagan is an ancient city in Myanmar famous for its thousands of well-preserved temples and pagodas. Bagan is a fascinating destination for those interested in history, architecture, and spirituality, and is a must-see for anyone traveling to Myanmar. Bagan is one of the Unesco places in Myanmar."],["Inlay Lake", "inlay","Inlay Lake is a freshwater lake located in the Shan Hills of Myanmar. The lake is known for the unique leg-rowing technique of the local Intha people. Everyone should visit there because it offers a unique and unforgettable glimpse into the country's rich cultural heritage."], ["U Bein Bridge", "oopain","The U Bein Bridge is a magnificent teakwood bridge located in Mandalay, Myanmar, and is the longest teakwood bridge in the world. The U Bein Bridge is an iconic symbol of Myanmar's rich cultural heritage and is a must-visit destination for anyone traveling to Mandalay."],["Pyin Oo Lwin", "pyinoolwin","Pyin Oo Lwin is a picturesque hill town located in the Mandalay Region of Myanmar and is a popular tourist destination for its cool climate, stunning natural beauty, and charming colonial architecture. The town was established as a British hill station during the colonial era, and many of its buildings still retain their colonial charm."]]),
        
        ArticleBrain(id: 1, title: "Famous Festivals", description: "There are many festivals in Myanmar. Among the many famous festivals in Myanmar, the following festivals are famous and important for Myanmar culture.", image: "tasaungthai", topic: [[" Myanmar Water Festival", "thingyan", "The Myanmar Water Festival, also known as Thingyan, is a traditional four-day festival celebrated in mid-April to mark the beginning of the Burmese New Year, during which people splash water on each other as a symbol of cleansing and renewal. Thingyan is the most important festival in Myanmar"],["Thadingyut", "festival","Thadingyut Festival is a three-day festival celebrated in Myanmar during October, marked by the lighting of candles and lanterns, traditional dance and music performances, and the giving of alms to monks and the elderly. Thadingyut festival is also known as Myanmar Lighting festival "], ["Tazaungdaing", "fireballoon","The Tazaungdaing Festival is a three-day festival celebrated by the Shan people in Myanmar during November, marked by the offering of food and gifts, and traditional dance performances. Furthermore, Thaung Gyi Fire Balloon Festival is a highlight of the Tazaungdaing Festival celebrated by the Shan people in Myanmar during November"]]),
        
        ArticleBrain(id: 2, title: "Traditional Foods", description: "Myanmar's traditional foods are unique and delicious. There are many Myanmar traditional foods. Among them, the following foods represent the Myanmar culture.", image: "myanmar food",topic: [["Mohinga","motehingar","Mohinga is a popular fish-based soup dish in Myanmar, typically eaten for breakfast and served with rice noodles, various toppings, and fresh herbs. It is a flavorful and comforting dish that reflects the cultural diversity of Myanmar's culinary traditions. It is a must-try for anyone visiting Myanmar."],["Mote Lone Yay Paw", "mote lone", "Mont Lone Yay Paw is a traditional sweet dish in Myanmar made with glutinous rice flour, jaggery, and coconut shavings, shaped into small balls, and steamed until cooked. Mont Lone Yay Paw is a popular snack and dessert in Myanmar, often served at the Myanmar water festival. It is a delicious and satisfying treat that showcases the country's rich culinary heritage."], ["Lat Phat Thoke", "latphat","Laphet Thoke is a popular Burmese salad made from pickled tea leaves, shredded cabbage, tomatoes, peanuts, garlic, and chili. The dish is known for its unique mix of sweet, salty, and sour flavors, with a slight bitterness from the tea leaves. Laphet Thoke is also a popular gift to bring back home for friends and family."],["Pae Pyote Nan Pyar", "pal pyote", "Pae Pyote is a brown boiled bean and Nan Pyar is a type of flatbread. These two dishes were reportedly among General Aung San's favorite foods, and they have become associated with his legacy and are often served at commemorative events and ceremonies in his honor. Pae Pyote and Nan Pyar serve as a reminder of the country's struggle for independence."]]),
        
        ArticleBrain(id: 3, title: "Iconic People", description: "Myanmar people are bright and brave. Among them, the following people are iconic people in Myanmar because they made a lot of changes not only for Myanmar but also for the world.", image: "u thant",topic: [["Daw Aung San Su Kyi","daw aung san su kyi","Daw Aung San Suu Kyi is a Burmese politician who spent several years under house arrest advocating democracy and human rights. She became Myanmar's State Counsellor in 2016. She was awarded the Nobel Peace Prize in 1991 in recognition of her brave struggle for democracy in Myanmar."], ["General Aung San", "general aung san","General Aung San was a Burmese nationalist leader who fought for Myanmar's independence from British colonial rule and founded the Burmese Independence Army. He was assassinated in 1947, but his legacy as a national hero continues to inspire the people of Myanmar. Daw Aung San Su Kyi is daughter of General Aung San"],["U Thant", "u thant", "U Thant was a Burmese diplomat and the third Secretary-General of the United Nations, known for his contributions to international peacekeeping and advocacy for decolonization, nuclear disarmament, and global environmental issues. He was the first non-European and the first Asian to hold the position of Secretary-General of the United Nations."]])
    ]
    
    func foodCount() -> Int {
        return articles.count
    }
    
    func articleCollections() -> [ArticleBrain] {
        return articles
    }
    
    func getArticle(i : Int) -> ArticleBrain {
        return articles[i]
    }
    
    func getTitle(count : Int) -> String {
        return articles[count].title
    }
    
    func description(count : Int) -> String {
        return articles[count].description
    }
    
    func image(count : Int) -> String {
        return articles[count].image
    }
}

