.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$2;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll;->add(Landroid/app/Activity;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 46
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$2;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 48
    sget-boolean v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->shuffleOn:Z

    xor-int/lit8 v0, v0, 0x1

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->shuffleOn:Z

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    .line 49
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$2;->val$a:Landroid/app/Activity;

    const-string v0, "melodix_playall"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "shuffle"

    sget-boolean v1, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->shuffleOn:Z

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 50
    return-void
.end method
