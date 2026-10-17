.class public final Lz3;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field public final synthetic j:Le4;

.field public final synthetic k:Lb4;


# direct methods
.method public constructor <init>(Lb4;Le4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz3;->k:Lb4;

    .line 5
    .line 6
    iput-object p2, p0, Lz3;->j:Le4;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    .line 1
    iget-object p1, p0, Lz3;->k:Lb4;

    .line 2
    .line 3
    iget-object p2, p1, Lb4;->q:Landroid/content/DialogInterface$OnClickListener;

    .line 4
    .line 5
    iget-object p0, p0, Lz3;->j:Le4;

    .line 6
    .line 7
    iget-object p4, p0, Le4;->b:Lg4;

    .line 8
    .line 9
    invoke-interface {p2, p4, p3}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    .line 10
    .line 11
    .line 12
    iget-boolean p1, p1, Lb4;->u:Z

    .line 13
    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Le4;->b:Lg4;

    .line 17
    .line 18
    invoke-virtual {p0}, Lg4;->dismiss()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
