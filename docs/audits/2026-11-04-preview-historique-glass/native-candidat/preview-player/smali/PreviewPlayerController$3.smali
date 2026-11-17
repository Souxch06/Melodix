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

    .prologue
    .line 232
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public loaded(Lcom/melodix/music/PreviewLastTrackStore$Record;Landroid/graphics/Bitmap;Ljava/lang/String;)V
    .locals 12

    .prologue
    const-wide/16 v10, 0x0

    const-wide/16 v8, -0x1

    const/4 v6, 0x1

    const/4 v4, 0x0

    .line 234
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0, v4}, Lcom/melodix/music/PreviewPlayerController;->access$20(Lcom/melodix/music/PreviewPlayerController;Z)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "lecture : "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->access$21(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)V

    .line 235
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$19(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 236
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->access$22(Lcom/melodix/music/PreviewPlayerController;)Z

    move-result v1

    if-nez v1, :cond_0

    if-nez p1, :cond_4

    .line 237
    :cond_0
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->access$22(Lcom/melodix/music/PreviewPlayerController;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$23(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " ; remplac\u00e9 par observation Spotify"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->access$21(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)V

    .line 239
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->access$2(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->access$24(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v4

    sub-long/2addr v2, v4

    invoke-static {v10, v11, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->access$25(Lcom/melodix/music/PreviewPlayerController;J)V

    .line 267
    :goto_1
    return-void

    .line 238
    :cond_2
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$23(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " ; activit\u00e9 indisponible"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->access$21(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)V

    goto :goto_0

    .line 241
    :cond_4
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v1, v6}, Lcom/melodix/music/PreviewPlayerController;->access$26(Lcom/melodix/music/PreviewPlayerController;Z)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v2, v6}, Lcom/melodix/music/PreviewPlayerController;->access$27(Lcom/melodix/music/PreviewPlayerController;Z)V

    invoke-static {v1, v6}, Lcom/melodix/music/PreviewPlayerController;->access$28(Lcom/melodix/music/PreviewPlayerController;Z)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v2, v4}, Lcom/melodix/music/PreviewPlayerController;->access$29(Lcom/melodix/music/PreviewPlayerController;Z)V

    invoke-static {v1, v4}, Lcom/melodix/music/PreviewPlayerController;->access$16(Lcom/melodix/music/PreviewPlayerController;Z)V

    .line 242
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v3, v4}, Lcom/melodix/music/PreviewPlayerController;->access$30(Lcom/melodix/music/PreviewPlayerController;Z)V

    invoke-static {v2, v4}, Lcom/melodix/music/PreviewPlayerController;->access$31(Lcom/melodix/music/PreviewPlayerController;Z)V

    invoke-static {v1, v4}, Lcom/melodix/music/PreviewPlayerController;->access$32(Lcom/melodix/music/PreviewPlayerController;Z)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const-string v2, "unknown"

    invoke-static {v1, v2}, Lcom/melodix/music/PreviewPlayerController;->access$33(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)V

    .line 243
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v2, p1, Lcom/melodix/music/PreviewLastTrackStore$Record;->title:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/melodix/music/PreviewPlayerController;->access$34(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v2, p1, Lcom/melodix/music/PreviewLastTrackStore$Record;->artist:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/melodix/music/PreviewPlayerController;->access$35(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-wide v4, p1, Lcom/melodix/music/PreviewLastTrackStore$Record;->duration:J

    invoke-static {v2, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->access$36(Lcom/melodix/music/PreviewPlayerController;J)V

    invoke-static {v1, v4, v5}, Lcom/melodix/music/PreviewPlayerController;->access$37(Lcom/melodix/music/PreviewPlayerController;J)V

    .line 244
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-wide v2, p1, Lcom/melodix/music/PreviewLastTrackStore$Record;->position:J

    long-to-double v2, v2

    invoke-static {v1, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->access$12(Lcom/melodix/music/PreviewPlayerController;D)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerController;->access$2(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->access$13(Lcom/melodix/music/PreviewPlayerController;J)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const-wide/16 v2, 0x0

    invoke-static {v1, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->access$14(Lcom/melodix/music/PreviewPlayerController;D)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const-string v2, ""

    invoke-static {v1, v2}, Lcom/melodix/music/PreviewPlayerController;->access$38(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)V

    .line 245
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v2, v8, v9}, Lcom/melodix/music/PreviewPlayerController;->access$39(Lcom/melodix/music/PreviewPlayerController;J)V

    invoke-static {v1, v8, v9}, Lcom/melodix/music/PreviewPlayerController;->access$40(Lcom/melodix/music/PreviewPlayerController;J)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v1, v8, v9}, Lcom/melodix/music/PreviewPlayerController;->access$41(Lcom/melodix/music/PreviewPlayerController;J)V

    .line 246
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const v2, 0x7f090236

    iget-object v3, p1, Lcom/melodix/music/PreviewLastTrackStore$Record;->title:Ljava/lang/String;

    invoke-static {v1, v0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->access$42(Lcom/melodix/music/PreviewPlayerController;Landroid/app/Activity;ILjava/lang/String;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const v2, 0x7f09023b

    iget-object v3, p1, Lcom/melodix/music/PreviewLastTrackStore$Record;->title:Ljava/lang/String;

    invoke-static {v1, v0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->access$42(Lcom/melodix/music/PreviewPlayerController;Landroid/app/Activity;ILjava/lang/String;)V

    .line 247
    const v1, 0x7f09023a

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 248
    if-nez v1, :cond_8

    const/4 v1, 0x0

    .line 249
    :goto_2
    instance-of v2, v1, Landroid/widget/TextView;

    if-eqz v2, :cond_5

    check-cast v1, Landroid/widget/TextView;

    const-string v2, "DERNI\u00c8RE LECTURE CONNUE"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 250
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p1, Lcom/melodix/music/PreviewLastTrackStore$Record;->artist:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, " \u00b7 Derni\u00e8re position connue"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 251
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const v3, 0x7f090237

    invoke-static {v2, v0, v3, v1}, Lcom/melodix/music/PreviewPlayerController;->access$42(Lcom/melodix/music/PreviewPlayerController;Landroid/app/Activity;ILjava/lang/String;)V

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    const v3, 0x7f09023c

    invoke-static {v2, v0, v3, v1}, Lcom/melodix/music/PreviewPlayerController;->access$42(Lcom/melodix/music/PreviewPlayerController;Landroid/app/Activity;ILjava/lang/String;)V

    .line 252
    if-eqz p2, :cond_7

    .line 253
    const v1, 0x7f090244

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f090245

    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 254
    instance-of v3, v1, Landroid/widget/ImageView;

    if-eqz v3, :cond_6

    check-cast v1, Landroid/widget/ImageView;

    invoke-virtual {v1, p2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 255
    :cond_6
    instance-of v1, v2, Landroid/widget/ImageView;

    if-eqz v1, :cond_7

    move-object v1, v2

    check-cast v1, Landroid/widget/ImageView;

    invoke-virtual {v1, p2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 257
    :cond_7
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v1, v6}, Lcom/melodix/music/PreviewPlayerController;->access$32(Lcom/melodix/music/PreviewPlayerController;Z)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->access$17(Lcom/melodix/music/PreviewPlayerController;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->access$43(Lcom/melodix/music/PreviewPlayerController;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->access$44(Lcom/melodix/music/PreviewPlayerController;)V

    .line 261
    const v1, 0x7f09022f

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0901c6

    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 262
    if-eqz v1, :cond_9

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_9

    if-eqz v0, :cond_9

    .line 263
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 264
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$23(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " ; vues appliqu\u00e9es ; \u00e9cran de chargement masqu\u00e9"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->access$21(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)V

    .line 266
    :goto_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->access$2(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->access$24(Lcom/melodix/music/PreviewPlayerController;)J

    move-result-wide v4

    sub-long/2addr v2, v4

    invoke-static {v10, v11, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/melodix/music/PreviewPlayerController;->access$25(Lcom/melodix/music/PreviewPlayerController;J)V

    goto/16 :goto_1

    .line 248
    :cond_8
    const-string v2, "previewPlayerDragHandle"

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    goto/16 :goto_2

    .line 265
    :cond_9
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$3;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$23(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " ; vues appliqu\u00e9es ; interface non visible ou indisponible"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerController;->access$21(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)V

    goto :goto_3
.end method
