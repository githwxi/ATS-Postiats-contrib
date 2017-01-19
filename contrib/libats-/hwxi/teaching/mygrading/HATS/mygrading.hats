(*
** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
** OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
** NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
** HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
** WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
** FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
** OTHER DEALINGS IN THE SOFTWARE.
*)

(* ****** ****** *)

(*
** A library of grading for my own use
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start time: the first of July, 2016
//
(* ****** ****** *)
//
#define
MYGRADING_HATS 1
//
(* ****** ****** *)
//
extern
fun
csv_parse_line
(
  line: string
) : List0_vt(Strptr1)
//
(* ****** ****** *)
//
extern
fun
csv_parse_line_nerr
(
  line: string, nerr: &int >> _
) : List0_vt(Strptr1)
//
(* ****** ****** *)

implement
csv_parse_line
  (line) = res0 where
{
//
var nerr: int = 0
val res0 = csv_parse_line_nerr(line, nerr)
//
} (* end of [csv_parse_line] *)

(* ****** ****** *)
//
local #include "./csv_parse_line.hats" in (*nothing*) end
//
(* ****** ****** *)

(* end of [mygrading.hats] *)
