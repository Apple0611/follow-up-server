class HomeController < ApplicationController
  def index
    @index_top_steps_card = [
      ["search-disease-1.png", "search_disease"],
      ["create-treatment-1.png", "create_treatment"],
      ["create-follow-up.png", "create_follow-up"],
      ["statistic-1.png", "statistics"]
    ]
    @index_news_feed_events = [
      {label_type: "img", label_content: "/images/avatar/small/elliot.jpg", summary: "<a class=\"user\">Elliot Fu</a> added you as a friend", date: "1 Hour Ago", like: "4 Likes"}, 
      {label_type: "i", label_content: "pencil", summary: "You submitted a new post to the page", date: "3 days ago", extra_type: "text", extra_content: "I'm having a BBQ this weekend. Come by around 4pm if you can.", like: "11 Likes"}, 
      {label_type: "img", label_content: "/images/avatar/small/helen.jpg", summary: "<a>Helen Troy</a> added <a>2 new illustrations</a>", date: "4 days ago", extra_type: "images", extra_content: "<a><img src=\"/images/wireframe/image.png\"></a><a><img src=\"/images/wireframe/image.png\"></a>", like: "1 Like"}, 
      {label_type: "img", label_content: "/images/avatar/small/jenny.jpg", summary: "<a class=\"user\">Jenny Hess</a> added you as a friend", date: "2 Hour Ago", like: "8 Likes"}, 
      {label_type: "img", label_content: "/images/avatar/small/joe.jpg", summary: "<a>Joe Henderson</a> posted on his page", date: "3 days ago", extra_type: "text", extra_content: "Ours is a life of constant reruns. We're always circling back to where we'd we started, then starting all over again. Even if we don't run extra laps that day, we surely will come back for more of the same another day soon.", like: "5 Likes"}, 
      {label_type: "img", label_content: "/images/avatar/small/justen.jpg", summary: "<a>Justen Kitsune</a> added <a>2 new photos</a> of you", date: "4 days ago", extra_type: "images", extra_content: "<a><img src=\"/images/wireframe/image.png\"></a><a><img src=\"/images/wireframe/image.png\"></a>", like: "41 Likes"}
    ]
    @index_news_my_treatment = [
      {header: "65岁男性急性肾功能衰竭治疗", desc: "2014年9月10日 星期一"},
      {header: "47岁男性急性肾小球肾炎", desc: "2014年9月15日 星期五"},
      {header: "52岁男性肾小管性酸中毒", desc: "2014年9月16日 星期六"}
    ]
    @index_news_my_contribution = [
      {icon: "help", header: "Floated Icon", desc: "This text will always have a left margin to make sure it sits alongside your icon"},
      {icon: "top aligned right triangle", header: "Icon Alignment", desc: "Floated icons are, by default, middle aligned. To have an icon top aligned try this example."},
      {icon: "help", header: "Floated Icon", desc: "This text will always have a left margin to make sure it sits alongside your icon"}
    ]
  end

  def search
  end
end
