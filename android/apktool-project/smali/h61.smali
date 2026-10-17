.class public final synthetic Lh61;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic j:Ljava/util/ArrayList;

.field public final synthetic k:I

.field public final synthetic l:Ljava/util/List;

.field public final synthetic m:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;ILjava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lh61;->j:Ljava/util/ArrayList;

    .line 5
    .line 6
    iput p2, p0, Lh61;->k:I

    .line 7
    .line 8
    iput-object p3, p0, Lh61;->l:Ljava/util/List;

    .line 9
    .line 10
    iput-object p4, p0, Lh61;->m:Ljava/util/List;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 1
    iget-object p1, p0, Lh61;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Lcom/melodix/music/e;

    .line 8
    .line 9
    iget-object p2, p2, Lcom/melodix/music/e;->a:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v0, p0, Lh61;->j:Ljava/util/ArrayList;

    .line 12
    .line 13
    iget v1, p0, Lh61;->k:I

    .line 14
    .line 15
    invoke-interface {v0, v1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lh61;->m:Ljava/util/List;

    .line 19
    .line 20
    invoke-static {p0, v0, p1}, Lcom/melodix/music/SettingsActivity$a;->U(Ljava/util/List;Ljava/util/ArrayList;Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
