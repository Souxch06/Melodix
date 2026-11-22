.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$6;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll;->addMenus(Landroid/app/Activity;Landroid/view/View;Lorg/json/JSONArray;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$rowView:Landroid/view/View;

.field final synthetic val$track:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Landroid/app/Activity;Lorg/json/JSONObject;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 118
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$6;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$6;->val$track:Lorg/json/JSONObject;

    iput-object p3, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$6;->val$rowView:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 118
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$6;->val$a:Landroid/app/Activity;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$6;->val$track:Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$6;->val$rowView:Landroid/view/View;

    invoke-static {p1, v0, v1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->sheet(Landroid/app/Activity;Lorg/json/JSONObject;Landroid/view/View;)V

    return-void
.end method
