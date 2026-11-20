.class Lcom/melodix/music/PreviewPlayerController$3;
.super Ljava/lang/Object;
.source "PreviewPlayerController.java"

# interfaces
.implements Lcom/melodix/music/PreviewLastTrackStore$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerController;->layoutReady()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerController;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 245
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public loaded(Lcom/melodix/music/PreviewLastTrackStore$Record;Landroid/graphics/Bitmap;Ljava/lang/String;)V
    .locals 9

    .line 247
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->access$1902(Lcom/melodix/music/PreviewPlayerController;Z)Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "lecture : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v0, p3}, Lcom/melodix/music/PreviewPlayerController;->access$2002(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)Ljava/lang/String;

    .line 248
    iget-object p3, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {p3}, Lcom/melodix/music/PreviewPlayerController;->access$1800(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/ref/WeakReference;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/app/Activity;

    .line 249
    const-wide/16 v2, 0x0

    if-eqz p3, :cond_4

    invoke-virtual {p3}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$2100(Lcom/melodix/music/PreviewPlayerController;)Z

    move-result v0

    if-nez v0, :cond_4

    if-nez p1, :cond_0

    goto/16 :goto_1

    .line 254
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const/4 v4, 0x1

    invoke-static {v0, v4}, Lcom/melodix/music/PreviewPlayerController;->access$2402(Lcom/melodix/music/PreviewPlayerController;Z)Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v5, v4}, Lcom/melodix/music/PreviewPlayerController;->access$1502(Lcom/melodix/music/PreviewPlayerController;Z)Z

    move-result v5

    invoke-static {v0, v5}, Lcom/melodix/music/PreviewPlayerController;->access$2502(Lcom/melodix/music/PreviewPlayerController;Z)Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v5, v1}, Lcom/melodix/music/PreviewPlayerController;->access$2602(Lcom/melodix/music/PreviewPlayerController;Z)Z

    move-result v5

    invoke-static {v0, v5}, Lcom/melodix/music/PreviewPlayerController;->access$1402(Lcom/melodix/music/PreviewPlayerController;Z)Z

    .line 255
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v6, v1}, Lcom/melodix/music/PreviewPlayerController;->access$2902(Lcom/melodix/music/PreviewPlayerController;Z)Z

    move-result v1

    invoke-static {v5, v1}, Lcom/melodix/music/PreviewPlayerController;->access$2802(Lcom/melodix/music/PreviewPlayerController;Z)Z

    move-result v1

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->access$2702(Lcom/melodix/music/PreviewPlayerController;Z)Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const-string v1, "unknown"

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->access$1002(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)Ljava/lang/String;

    .line 256
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v1, p1, Lcom/melodix/music/PreviewLastTrackStore$Record;->title:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->access$3002(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v1, p1, Lcom/melodix/music/PreviewLastTrackStore$Record;->artist:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->access$3102(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-wide v5, p1, Lcom/melodix/music/PreviewLastTrackStore$Record;->duration:J

    invoke-static {v1, v5, v6}, Lcom/melodix/music/PreviewPlayerController;->access$802(Lcom/melodix/music/PreviewPlayerController;J)J

    move-result-wide v5

    invoke-static {v0, v5, v6}, Lcom/melodix/music/PreviewPlayerController;->access$3202(Lcom/melodix/music/PreviewPlayerController;J)J

    .line 257
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-wide v5, p1, Lcom/melodix/music/PreviewLastTrackStore$Record;->position:J

    long-to-double v5, v5

    invoke-static {v0, v5, v6}, Lcom/melodix/music/PreviewPlayerController;->access$702(Lcom/melodix/music/PreviewPlayerController;D)D

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->access$200(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v5

    invoke-static {v0, v5, v6}, Lcom/melodix/music/PreviewPlayerController;->access$1202(Lcom/melodix/music/PreviewPlayerController;J)J

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const-wide/16 v5, 0x0

    invoke-static {v0, v5, v6}, Lcom/melodix/music/PreviewPlayerController;->access$1302(Lcom/melodix/music/PreviewPlayerController;D)D

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->access$3302(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)Ljava/lang/String;

    .line 258
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const-wide/16 v5, -0x1

    invoke-static {v1, v5, v6}, Lcom/melodix/music/PreviewPlayerController;->access$3502(Lcom/melodix/music/PreviewPlayerController;J)J

    move-result-wide v7

    invoke-static {v0, v7, v8}, Lcom/melodix/music/PreviewPlayerController;->access$3402(Lcom/melodix/music/PreviewPlayerController;J)J

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0, v5, v6}, Lcom/melodix/music/PreviewPlayerController;->access$3602(Lcom/melodix/music/PreviewPlayerController;J)J

    .line 259
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const v1, 0x7f090236

    iget-object v5, p1, Lcom/melodix/music/PreviewLastTrackStore$Record;->title:Ljava/lang/String;

    invoke-static {v0, p3, v1, v5}, Lcom/melodix/music/PreviewPlayerController;->access$3700(Lcom/melodix/music/PreviewPlayerController;Landroid/app/Activity;ILjava/lang/String;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const v1, 0x7f09023b

    iget-object v5, p1, Lcom/melodix/music/PreviewLastTrackStore$Record;->title:Ljava/lang/String;

    invoke-static {v0, p3, v1, v5}, Lcom/melodix/music/PreviewPlayerController;->access$3700(Lcom/melodix/music/PreviewPlayerController;Landroid/app/Activity;ILjava/lang/String;)V

    .line 261
    iget-object p1, p1, Lcom/melodix/music/PreviewLastTrackStore$Record;->artist:Ljava/lang/String;

    .line 262
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const v1, 0x7f090237

    invoke-static {v0, p3, v1, p1}, Lcom/melodix/music/PreviewPlayerController;->access$3700(Lcom/melodix/music/PreviewPlayerController;Landroid/app/Activity;ILjava/lang/String;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const v1, 0x7f09023c

    invoke-static {v0, p3, v1, p1}, Lcom/melodix/music/PreviewPlayerController;->access$3700(Lcom/melodix/music/PreviewPlayerController;Landroid/app/Activity;ILjava/lang/String;)V

    .line 263
    if-eqz p2, :cond_2

    .line 264
    const p1, 0x7f090244

    invoke-virtual {p3, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f090245

    invoke-virtual {p3, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 265
    instance-of v1, p1, Landroid/widget/ImageView;

    if-eqz v1, :cond_1

    check-cast p1, Landroid/widget/ImageView;

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 266
    :cond_1
    instance-of p1, v0, Landroid/widget/ImageView;

    if-eqz p1, :cond_2

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 268
    :cond_2
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {p1, v4}, Lcom/melodix/music/PreviewPlayerController;->access$2702(Lcom/melodix/music/PreviewPlayerController;Z)Z

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerController;->access$1600(Lcom/melodix/music/PreviewPlayerController;)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerController;->access$3800(Lcom/melodix/music/PreviewPlayerController;)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerController;->access$3900(Lcom/melodix/music/PreviewPlayerController;)V

    .line 272
    const p1, 0x7f09022f

    invoke-virtual {p3, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0901c6

    invoke-virtual {p3, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p2

    .line 273
    if-eqz p1, :cond_3

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_3

    if-eqz p2, :cond_3

    .line 274
    const/16 p1, 0x8

    invoke-virtual {p2, p1}, Landroid/view/View;->setVisibility(I)V

    .line 275
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const-string p2, " ; vues appliqu\u00e9es ; \u00e9cran de chargement masqu\u00e9"

    invoke-static {p1, p2}, Lcom/melodix/music/PreviewPlayerController;->access$2084(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/Object;)Ljava/lang/String;

    goto :goto_0

    .line 276
    :cond_3
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const-string p2, " ; vues appliqu\u00e9es ; interface non visible ou indisponible"

    invoke-static {p1, p2}, Lcom/melodix/music/PreviewPlayerController;->access$2084(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/Object;)Ljava/lang/String;

    .line 277
    :goto_0
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object p2, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {p2}, Lcom/melodix/music/PreviewPlayerController;->access$200(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide p2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$2300(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v0

    sub-long/2addr p2, v0

    invoke-static {v2, v3, p2, p3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p2

    invoke-static {p1, p2, p3}, Lcom/melodix/music/PreviewPlayerController;->access$2202(Lcom/melodix/music/PreviewPlayerController;J)J

    .line 278
    return-void

    .line 250
    :cond_4
    :goto_1
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerController;->access$2100(Lcom/melodix/music/PreviewPlayerController;)Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const-string p2, " ; remplac\u00e9 par observation Spotify"

    invoke-static {p1, p2}, Lcom/melodix/music/PreviewPlayerController;->access$2084(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/Object;)Ljava/lang/String;

    goto :goto_2

    .line 251
    :cond_5
    if-eqz p3, :cond_6

    invoke-virtual {p3}, Landroid/app/Activity;->isFinishing()Z

    move-result p1

    if-eqz p1, :cond_7

    :cond_6
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const-string p2, " ; activit\u00e9 indisponible"

    invoke-static {p1, p2}, Lcom/melodix/music/PreviewPlayerController;->access$2084(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/Object;)Ljava/lang/String;

    .line 252
    :cond_7
    :goto_2
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object p2, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {p2}, Lcom/melodix/music/PreviewPlayerController;->access$200(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide p2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$2300(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v0

    sub-long/2addr p2, v0

    invoke-static {v2, v3, p2, p3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p2

    invoke-static {p1, p2, p3}, Lcom/melodix/music/PreviewPlayerController;->access$2202(Lcom/melodix/music/PreviewPlayerController;J)J

    return-void
.end method
